-- Place this file in lua/plugins/python-workspace.lua
return {
    {
      "neovim/nvim-lspconfig",
      -- This will be merged with your existing lspconfig plugin
      opts = function(_, opts)
        local util = require("lspconfig.util")
        
        -- Get Python path from venv if it exists
        local function get_python_path(workspace)
          local venv_path = os.getenv("VIRTUAL_ENV")
          if venv_path then
            return util.path.join(venv_path, "bin", "python")
          end
          
          -- Try to find a venv directory
          local venv = util.find_node_modules_ancestor(workspace)
          if venv then
            venv = util.path.join(venv, "venv")
            if util.path.exists(util.path.join(venv, "bin", "python")) then
              return util.path.join(venv, "bin", "python")
            end
          end
          
          -- Look for specific venv from your config
          local home = os.getenv("HOME")
          if home and util.path.exists(util.path.join(home, "work", "venvs", "gv3", "bin", "python")) then
            return util.path.join(home, "work", "venvs", "gv3", "bin", "python")
          end
          
          -- Fallback to system Python
          return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
        end
        
        -- Setup logic for Pyright
        if not opts.setup or not opts.setup.pyright then
          opts.setup = opts.setup or {}
          opts.setup.pyright = function(_, server_opts)
            server_opts.before_init = function(_, config)
              local workspace = config.root_dir
              config.settings.python.pythonPath = get_python_path(workspace)
              
              -- Add custom extraPaths for Django projects
              local extraPaths = {
                workspace,  -- Add project root
              }
              
              -- If this is a Django project, add some common paths
              local is_django = util.path.exists(util.path.join(workspace, "manage.py"))
                             or util.path.exists(util.path.join(workspace, "cinehub", "manage.py"))
              
              if is_django then
                -- Add parent directory - useful for Django projects with apps
                table.insert(extraPaths, util.path.dirname(workspace))
              end
              
              -- Update config
              config.settings.python.analysis.extraPaths = config.settings.python.analysis.extraPaths or {}
              vim.list_extend(config.settings.python.analysis.extraPaths, extraPaths)
            end
            
            return false  -- Let lspconfig handle the rest
          end
        end
      end
    }
  }