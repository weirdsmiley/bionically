# bionically

This plugin will convert text on current buffer into a bionic reading font.

## Usage

Install the pluging using `vim-plug`. Place the following line in your `.vimrc`.

```vimscript
Plug 'weirdsmiley/bionically'
```

Source it and `:PlugInstall` to install.

For this plugin, you will have to subscribe to the [bionic-reading](https://bionic-reading.com/) [API](https://rapidapi.com/bionic-reading-bionic-reading-default/api/bionic-reading1/).

After subscribing to the API, switch to `Python->Requests` in Code Snippets section, and copy `url` and `headers` in `bionically/src/config.py` (create this file in the exact place as mentioned, relative to the plugin's installation directory).

![Switch to Python->Requests](./assets/Img1.png?raw=true)


![Copy url and headers](./assets/Img2.png?raw=true)
