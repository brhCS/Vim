self: super:
{
  spacemacs = super.emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    # archives
    # company-rtags
    # csv-mode
    # doom-modeline
    # drupal-mode
    # evil-escape
    # evil-unimpaired
    # flycheck-rtags
    # font-lock
    # helm-rtags
    # mmm-mode
    # org-plus-contrib
    # php-extras
    # rtags
    # shrink-path
    # spinner
    # sql-indent
    # undo-tree
    ac-ispell
    ac-php-core
    ace-jump-helm-line
    ace-link
    ace-window
    adoc-mode
    aggressive-indent
    alert
    all-the-icons
    anaconda-mode
    ansible
    ansible-doc
    anzu
    async
    auto-compile
    auto-complete
    auto-dictionary
    auto-highlight-symbol
    auto-yasnippet
    avy
    bind-key
    bind-map
    browse-at-remote
    bundler
    centered-cursor-mode
    chruby
    clang-format
    clean-aindent-mode
    cmm-mode
    column-enforce-mode
    company
    company-anaconda
    company-ansible
    company-c-headers
    company-cabal
    company-emacs-eclim
    company-ghc
    company-go
    company-lua
    company-nixos-options
    company-php
    company-plsense
    company-quickhelp
    company-restclient
    company-shell
    company-statistics
    company-tern
    company-terraform
    company-web
    company-ycmd
    concurrent
    confluence
    counsel
    counsel-projectile
    ctable
    cython-mode
    dactyl-mode
    dash
    dash-functional
    deferred
    define-word
    diff-hl
    diminish
    disaster
    docker
    docker-tramp
    dockerfile-mode
    dotenv-mode
    dumb-jump
    eclim
    editorconfig
    eldoc-eval
    elisp-slime-nav
    emmet-mode
    engine-mode
    ensime
    epc
    epl
    esh-help
    eshell-prompt-extras
    eshell-z
    eval-sexp-fu
    evil
    evil-anzu
    evil-args
    evil-cleverparens
    evil-ediff
    evil-exchange
    evil-goggles
    evil-iedit-state
    evil-indent-plus
    evil-ledger
    evil-lion
    evil-lisp-state
    evil-magit
    evil-matchit
    evil-mc
    evil-nerd-commenter
    evil-numbers
    evil-org
    evil-surround
    evil-tutor
    evil-visual-mark-mode
    evil-visualstar
    expand-region
    eyebrowse
    f
    fancy-battery
    fill-column-indicator
    fish-mode
    flx
    flx-ido
    flycheck
    flycheck-bashate
    flycheck-haskell
    flycheck-ledger
    flycheck-pos-tip
    flycheck-ycmd
    flyspell-correct
    flyspell-correct-helm
    fringe-helper
    fuzzy
    ggtags
    gh-md
    ghc
    git-commit
    git-gutter
    git-gutter-fringe
    git-link
    git-messenger
    git-timemachine
    gitattributes-mode
    gitconfig-mode
    gitignore-mode
    gitignore-templates
    gntp
    gnuplot
    go-eldoc
    go-fill-struct
    go-gen-test
    go-guru
    go-impl
    go-mode
    go-rename
    go-tag
    godoctor
    golden-ratio
    google-c-style
    google-translate
    goto-chg
    gradle-mode
    graphviz-dot-mode
    groovy-imports
    groovy-mode
    haml-mode
    haskell-mode
    haskell-snippets
    hcl-mode
    helm
    helm-ag
    helm-c-yasnippet
    helm-company
    helm-core
    helm-css-scss
    helm-dash
    helm-descbinds
    helm-flx
    helm-git-grep
    helm-gitignore
    helm-gtags
    helm-hoogle
    helm-make
    helm-mode-manager
    helm-nixos-options
    helm-org-rifle
    helm-projectile
    helm-purpose
    helm-pydoc
    helm-swoop
    helm-themes
    helm-xref
    hierarchy
    highlight
    highlight-indentation
    highlight-numbers
    highlight-parentheses
    hindent
    hl-todo
    hlint-refactor
    ht
    htmlize
    hungry-delete
    hydra
    ibuffer-projectile
    iedit
    imenu-list
    impatient-mode
    importmagic
    indent-guide
    inf-ruby
    insert-shebang
    ivy
    jenkins
    jinja2-mode
    js-doc
    js2-mode
    js2-refactor
    json-mode
    json-navigator
    json-reformat
    json-snatcher
    know-your-http-well
    ledger-mode
    link-hint
    live-py-mode
    livid-mode
    log4e
    lorem-ipsum
    lua-mode
    macrostep
    magit
    magit-gitflow
    magit-popup
    magit-svn
    markdown-mode
    markdown-toc
    markup-faces
    maven-test-mode
    meghanada
    memoize
    minitest
    mmm-jinja2
    move-text
    multi-term
    multiple-cursors
    mvn
    mwim
    nameless
    nginx-mode
    nix-mode
    nix-update
    nixos-options
    ob-http
    ob-restclient
    open-junk-file
    org-brain
    org-bullets
    org-category-capture
    org-download
    org-jira
    org-mime
    org-pomodoro
    org-present
    org-projectile
    orgit
    overseer
    ox-gfm
    ox-pandoc
    ox-twbs
    p4
    package-lint
    packed
    pandoc-mode
    paradox
    paredit
    parent-mode
    password-generator
    pcache
    pcre2el
    persp-mode
    pfuture
    php-auto-yasnippets
    php-mode
    phpcbf
    phpunit
    pip-requirements
    pipenv
    pippel
    pkg-info
    popup
    popwin
    pos-tip
    powerline
    prettier-js
    projectile
    pug-mode
    py-isort
    pyenv-mode
    pytest
    pythonic
    pyvenv
    rainbow-delimiters
    rake
    rbenv
    request
    request-deferred
    restart-emacs
    restclient
    restclient-helm
    robe
    rpm-spec-mode
    rspec-mode
    rubocop
    ruby-hash-syntax
    ruby-refactor
    ruby-test-mode
    ruby-tools
    rvm
    s
    salt-mode
    sass-mode
    sbt-mode
    scala-mode
    scss-mode
    seeing-is-believing
    shell-pop
    simple-httpd
    skewer-mode
    slim-mode
    smartparens
    smeargle
    spaceline
    spaceline-all-the-icons
    string-inflection
    swiper
    symon
    systemd
    tablist
    tagedit
    tern
    terraform-mode
    toc-org
    treemacs
    treemacs-evil
    treemacs-projectile
    unfill
    use-package
    uuidgen
    vi-tilde-fringe
    vimrc-mode
    volatile-highlights
    web-beautify
    web-completion-data
    web-mode
    which-key
    window-purpose
    winum
    with-editor
    ws-butler
    xcscope
    xml-rpc
    xterm-color
    yaml-mode
    yapfify
    yasnippet
    yasnippet-snippets
    ycmd
    zeal-at-point
  ]));

  # Minimal set of packages to install everywhere
  minEnv = super.hiPrio (super.buildEnv {
    name = "minEnv";
    paths = [
      self.bashInteractive
      self.bat
      self.bc
      self.coreutils
      self.curl
      self.feh
      self.file
      self.gitAndTools.hub
      self.global
      self.gnused
      self.gnutar
      self.htop
      self.jq
      self.nox
      self.par
      self.pass
      self.pinentry
      self.procps
      self.ripgrep
      self.rlwrap
      self.tmux
      self.tree
      self.unzip
      self.wget
      self.ycmd
      self.zsh
    ];
  });

  # For "permanent" systems
  bigEnv = super.hiPrio (super.buildEnv {
    name = "bigEnv";
    paths = [
      self.alsaUtils
      self.aspell
      self.bind
      self.calibre
      self.chromium
      self.cmake
      self.digikam
      self.spacemacs
      self.firefox
      self.git-crypt
      self.gnumake
      self.gnupg
      self.gnutls
      self.graphviz
      self.httpie
      self.icu
      self.imagemagick
      self.irssi
      self.ledger
      self.lftp
      self.mupdf
      self.mupdf
      self.neovim
      self.nethogs
      self.nixops
      self.pandoc
      self.pdsh
      self.poppler_utils
      self.shellcheck
      self.sloc
      self.source-code-pro
      self.truecrypt
      self.upower
      self.vagrant
      self.vimPlugins.youcompleteme
      self.vlc
      self.weechat
      self.xclip
      self.xsel
      self.zeal
      self.zlib
    ];
  });

  pyEnv = super.hiPrio (self.python3.withPackages (ps: with ps; [
    flake8
    isort
    numpy
    ofxclient
    paramiko
    pep8
    pylint
    setuptools
    toolz
    yamllint
    yapf
  ]));

  haskellEnv = self.haskellPackages.ghcWithPackages (ps: with ps; [
    Cabal
    async
    dhall
    dhall-bash
    dhall-json
    dhall-nix
    filepath
    ghc-mod
    hindent
    hlint
    hoogle
    optparse-generic
    text
    text-show
    trifecta
    turtle
    xmobar
    xmonad
    xmonad-contrib
    xmonad-extras
  ]);
}
