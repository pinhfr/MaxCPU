<!DOCTYPE html>
<html lang='en'>
<head prefix='og: http://ogp.me/ns#'>
<meta charset='utf-8'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='object' property='og:type'>
<meta content='GitLab' property='og:site_name'>
<meta content='README.md · master · Francys de A. Pinheiro / MaxCPU' property='og:title'>
<meta content='Functional CPU Model within the scope of the lecture "Entwurf digitaler Systeme mit VHDL und SystemC" (TUM SS16)' property='og:description'>
<meta content='https://gitlab.lrz.de/assets/gitlab_logo-cdf021b35c4e6bb149e26460f26fae81e80552bc879179dd80e9e9266b14e894.png' property='og:image'>
<meta content='https://gitlab.lrz.de/pinhfr/MaxCPU/blob/master/README.md' property='og:url'>
<meta content='summary' property='twitter:card'>
<meta content='README.md · master · Francys de A. Pinheiro / MaxCPU' property='twitter:title'>
<meta content='Functional CPU Model within the scope of the lecture "Entwurf digitaler Systeme mit VHDL und SystemC" (TUM SS16)' property='twitter:description'>
<meta content='https://gitlab.lrz.de/assets/gitlab_logo-cdf021b35c4e6bb149e26460f26fae81e80552bc879179dd80e9e9266b14e894.png' property='twitter:image'>

<title>README.md · master · Francys de A. Pinheiro / MaxCPU · GitLab</title>
<meta content='Functional CPU Model within the scope of the lecture "Entwurf digitaler Systeme mit VHDL und SystemC" (TUM SS16)' name='description'>
<link rel="shortcut icon" type="image/x-icon" href="/assets/favicon-075eba76312e8421991a0c1f89a89ee81678bcde72319dd3e8047e2a47cd3a42.ico" />
<link rel="stylesheet" media="all" href="/assets/application-4e27b22391bb1664b7648ab62c8d19e71c6f9cb87a0592b3e93adb4dea7fc5f4.css" />
<link rel="stylesheet" media="print" href="/assets/print-68eed6d8135d858318821e790e25da27b2b4b9b8dbb1993fa6765d8e2e3e16ee.css" />
<script src="/assets/application-c77a3d3ce302326b854ecff6b7df4ca04211e93126a61ab3bcc63b95c5af7cdb.js"></script>
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="Cejv1o2opRHruzdPuH3g8SxsQV7fACt8k+c1vVbkp9ybN3yGGMJDe0aqo7uZiUZtjCHkUHRkHaTmTvXYhKtcQg==" />
<script>
//<![CDATA[
window.gon={};gon.api_version="v3";gon.default_avatar_url="https://gitlab.lrz.de/assets/no_avatar-07eeb128b993e74003e8664cff0b8e1e7234cec0443766a6763df32ca3472c23.png";gon.default_issues_tracker="gitlab";gon.max_file_size=10;gon.relative_url_root="";gon.user_color_scheme="white";gon.current_user_id=2212;gon.api_token="xuju1GzaZEVR771LwrMr";
//]]>
</script>
<meta content='origin-when-cross-origin' name='referrer'>
<meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'>
<meta content='#474D57' name='theme-color'>
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-iphone-2d64ecc33893baab71adc15ff19a803a59911cc2651fb9d4d62af1379ff89aab.png" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-ipad-d08897d57e1bc9400024ac15465340e832a8e7b166b91624138d48ea2c739596.png" sizes="76x76" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-iphone-retina-81446c57f3351d1dacd0fb5f23ced74ba63d3878810bedea343999c6a12b3915.png" sizes="120x120" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/touch-icon-ipad-retina-e2a776da039936ac240e76615add47b25ab77c75a5fa2d1b3907f83d5502b911.png" sizes="152x152" />
<link color='rgb(226, 67, 41)' href='/assets/logo-d36b5212042cebc89b96df4bf6ac24e43db316143e89926c0db839ff694d2de4.svg' rel='mask-icon'>
<meta content='/assets/msapplication-tile-49c9c46afd2ab9bbf35e69138bc62f8c31fa55584bd494956ac6e58e6aadc813.png' name='msapplication-TileImage'>
<meta content='#30353E' name='msapplication-TileColor'>




<style>
  [data-user-is] {
    display: none !important;
  }
  
  [data-user-is="2212"] {
    display: block !important;
  }
  
  [data-user-is="2212"][data-display="inline"] {
    display: inline !important;
  }
  
  [data-user-is-not] {
    display: block !important;
  }
  
  [data-user-is-not][data-display="inline"] {
    display: inline !important;
  }
  
  [data-user-is-not="2212"] {
    display: none !important;
  }
</style>

</head>

<body class='ui_blue' data-page='projects:blob:show'>
<script>
  window.project_uploads_path = "/pinhfr/MaxCPU/uploads";
  window.markdown_preview_path = "/pinhfr/MaxCPU/markdown_preview";
</script>

<header class='header-expanded navbar navbar-fixed-top navbar-gitlab'>
<div class='container-fluid'>
<div class='header-content'>
<button class='navbar-toggle' type='button'>
<span class='sr-only'>Toggle navigation</span>
<i class="fa fa-bars"></i>
</button>
<div class='navbar-collapse collapse'>
<ul class='nav navbar-nav'>
<li class='hidden-sm hidden-xs'>
<div class='has-location-badge search search-form'>
<form class="navbar-form" action="/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
<div class='search-input-container'>
<div class='search-location-badge'>
<span class='location-badge'>
<i class='location-text'>
This project
</i>
</span>
</div>
<div class='search-input-wrap'>
<div class='dropdown' data-url='/search/autocomplete'>
<input type="search" name="search" id="search" placeholder="Search" class="search-input dropdown-menu-toggle" spellcheck="false" tabindex="1" autocomplete="off" data-toggle="dropdown" />
<div class='dropdown-menu dropdown-select'>
<div class="dropdown-content"><ul>
<li>
<a class='is-focused dropdown-menu-empty-link'>
Loading...
</a>
</li>
</ul>
</div><div class="dropdown-loading"><i class="fa fa-spinner fa-spin"></i></div>
</div>
<i class='search-icon'></i>
<i class='clear-icon js-clear-input'></i>
</div>
</div>
</div>
<input type="hidden" name="group_id" id="group_id" />
<input type="hidden" name="project_id" id="search_project_id" value="3054" />
<input type="hidden" name="search_code" id="search_code" value="true" />
<input type="hidden" name="repository_ref" id="repository_ref" value="master" />

<div class='search-autocomplete-opts hide' data-autocomplete-path='/search/autocomplete' data-autocomplete-project-id='3054' data-autocomplete-project-ref='master'></div>
</form>

</div>

</li>
<li class='visible-sm visible-xs'>
<a title="Search" data-toggle="tooltip" data-placement="bottom" data-container="body" href="/search"><i class="fa fa-search"></i>
</a></li>
<li>
<a title="Todos" data-toggle="tooltip" data-placement="bottom" data-container="body" href="/dashboard/todos"><span class='badge todos-pending-count'>
0
</span>
</a></li>
<li>
<a title="New project" data-toggle="tooltip" data-placement="bottom" data-container="body" href="/projects/new"><i class="fa fa-plus fa-fw"></i>
</a></li>
<li>
<a class="logout" title="Sign out" data-toggle="tooltip" data-placement="bottom" data-container="body" rel="nofollow" data-method="delete" href="/users/sign_out"><i class="fa fa-sign-out"></i>
</a></li>
</ul>
</div>
<h1 class='title'><a href="/u/pinhfr">Francys de A. Pinheiro</a> / <a class="project-item-select-holder" href="/pinhfr/MaxCPU">MaxCPU</a><i data-target=".js-dropdown-menu-projects" data-toggle="dropdown" class="fa fa-chevron-down dropdown-toggle-caret js-projects-dropdown-toggle"></i> &middot; <a href="/pinhfr/MaxCPU/tree/master">Files</a></h1>
<div class='js-dropdown-menu-projects'>
<div class='dropdown-menu dropdown-select dropdown-menu-projects'>
<div class="dropdown-title"><span>Go to a project</span><button class="dropdown-title-button dropdown-menu-close" aria-label="Close" type="button"><i class="fa fa-times dropdown-menu-close-icon"></i></button></div>
<div class="dropdown-input"><input type="search" id="" class="dropdown-input-field" placeholder="Search your projects" /><i class="fa fa-search dropdown-input-search"></i><i role="button" class="fa fa-times dropdown-input-clear js-dropdown-input-clear"></i></div>
<div class="dropdown-content"></div>
<div class="dropdown-loading"><i class="fa fa-spinner fa-spin"></i></div>
</div>
</div>

</div>
</div>
</header>

<script>
  var findFileURL = "/pinhfr/MaxCPU/find_file/master";
</script>

<div class='page-sidebar-expanded page-with-sidebar'>


<div class='nicescroll sidebar-expanded sidebar-wrapper'>
<div class='header-logo'>
<a id='logo'>
<img src="/uploads/appearance/header_logo/1/logo-lrz.png" alt="Logo lrz" />
</a>
<a class="gitlab-text-container-link" title="Dashboard" id="js-shortcuts-home" href="/"><div class='gitlab-text-container'>
<h3>GitLab</h3>
</div>
</a></div>
<ul class='nav nav-sidebar'>
<li class=""><a title="Go to dashboard" class="back-link" href="/"><i class="fa fa-caret-square-o-left fa-fw"></i>
<span>
Go to dashboard
</span>
</a></li><li class='separate-item'></li>
<li class="home"><a title="Project" class="shortcuts-project" href="/pinhfr/MaxCPU"><i class="fa fa-bookmark fa-fw"></i>
<span>
Project
</span>
</a></li><li class=""><a title="Activity" class="shortcuts-project-activity" href="/pinhfr/MaxCPU/activity"><i class="fa fa-dashboard fa-fw"></i>
<span>
Activity
</span>
</a></li><li class="active"><a title="Files" class="shortcuts-tree" href="/pinhfr/MaxCPU/tree/master"><i class="fa fa-files-o fa-fw"></i>
<span>
Files
</span>
</a></li><li class=""><a title="Commits" class="shortcuts-commits" href="/pinhfr/MaxCPU/commits/master"><i class="fa fa-history fa-fw"></i>
<span>
Commits
</span>
</a></li><li class=""><a title="Graphs" class="shortcuts-graphs" href="/pinhfr/MaxCPU/graphs/master"><i class="fa fa-area-chart fa-fw"></i>
<span>
Graphs
</span>
</a></li><li class=""><a title="Milestones" href="/pinhfr/MaxCPU/milestones"><i class="fa fa-clock-o fa-fw"></i>
<span>
Milestones
</span>
</a></li><li class=""><a title="Issues" class="shortcuts-issues" href="/pinhfr/MaxCPU/issues"><i class="fa fa-exclamation-circle fa-fw"></i>
<span>
Issues
<span class='count issue_counter'>0</span>
</span>
</a></li><li class=""><a title="Merge Requests" class="shortcuts-merge_requests" href="/pinhfr/MaxCPU/merge_requests"><i class="fa fa-tasks fa-fw"></i>
<span>
Merge Requests
<span class='count merge_counter'>0</span>
</span>
</a></li><li class=""><a title="Members" class="team-tab tab" href="/pinhfr/MaxCPU/project_members"><i class="fa fa-users fa-fw"></i>
<span>
Members
</span>
</a></li><li class=""><a title="Labels" href="/pinhfr/MaxCPU/labels"><i class="fa fa-tags fa-fw"></i>
<span>
Labels
</span>
</a></li><li class=""><a title="Wiki" class="shortcuts-wiki" href="/pinhfr/MaxCPU/wikis/home"><i class="fa fa-book fa-fw"></i>
<span>
Wiki
</span>
</a></li><li class=""><a title="Forks" href="/pinhfr/MaxCPU/forks"><i class="fa fa-code-fork fa-fw"></i>
<span>
Forks
</span>
</a></li><li class=""><a title="Snippets" class="shortcuts-snippets" href="/pinhfr/MaxCPU/snippets"><i class="fa fa-clipboard fa-fw"></i>
<span>
Snippets
</span>
</a></li><li class="separate-item"><a title="Settings" href="/pinhfr/MaxCPU/edit"><i class="fa fa-cogs fa-fw"></i>
<span>
Settings
</span>
</a></li><li class='hidden'>
<a title="Network" class="shortcuts-network" href="/pinhfr/MaxCPU/network/master">Network
</a></li>
</ul>

<div class='collapse-nav'>
<a class="toggle-nav-collapse" title="Open/Close" href="#"><i class="fa fa-angle-left"></i></a>

</div>
<a class="sidebar-user" title="Profile" href="/u/pinhfr"><img alt="Profile" class="avatar avatar s36" src="/assets/no_avatar-07eeb128b993e74003e8664cff0b8e1e7234cec0443766a6763df32ca3472c23.png" />
<div class='username'>
pinhfr
</div>
</a></div>
<div class='content-wrapper'>
<div class='flash-container'>
</div>


<div class='container-fluid container-limited'>
<div class='content'>
<div class='clearfix'>


<div class='tree-holder' id='tree-holder'>
<div class='nav-block'>
<div class='tree-ref-holder'>
<form class="project-refs-form" action="/pinhfr/MaxCPU/refs/switch" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
<select name="ref" id="ref" class="project-refs-select select2 select2-sm"><optgroup label="Branches"><option selected="selected" value="master">master</option></optgroup><optgroup label="Tags"></optgroup></select>
<input type="hidden" name="destination" id="destination" value="blob" />
<input type="hidden" name="path" id="path" value="README.md" />
</form>


</div>
<ul class='breadcrumb repo-breadcrumb'>
<li>
<a href="/pinhfr/MaxCPU/tree/master">MaxCPU
</a></li>
<li>
<a href="/pinhfr/MaxCPU/blob/master/README.md"><strong>
README.md
</strong>
</a></li>
</ul>
</div>
<ul class='blob-commit-info hidden-xs'>
<li class='commit js-toggle-container' id='commit-25ba82db'>
<div class='commit-row-title'>
<span class='item-title'>
<a class="commit-row-message" href="/pinhfr/MaxCPU/commit/25ba82db26f06f528016f426857fc6717a241392">Update README.md</a>
</span>
<div class='pull-right'>
<button class="btn btn-clipboard" data-clipboard-text="25ba82db26f06f528016f426857fc6717a241392" type="button"><i class="fa fa-clipboard"></i></button>
<a class="commit_short_id" href="/pinhfr/MaxCPU/commit/25ba82db26f06f528016f426857fc6717a241392">25ba82db</a>
</div>
</div>
<div class='commit-row-info'>
by
<a class="commit-author-link has-tooltip" title="francysap@gmail.com" href="mailto:francysap@gmail.com"><img class="avatar s24" width="24" alt="" src="/assets/no_avatar-07eeb128b993e74003e8664cff0b8e1e7234cec0443766a6763df32ca3472c23.png" /> <span class="commit-author-name">pinhfr</span></a>
<div class='committed_ago'>
<time class="time_ago js-timeago js-timeago-pending" datetime="2016-05-04T16:03:18Z" title="May 4, 2016 6:03pm" data-toggle="tooltip" data-placement="top" data-container="body">2016-05-04 18:03:18 +0200</time><script>
//<![CDATA[
$('.js-timeago-pending').removeClass('js-timeago-pending').timeago()
//]]>
</script> &nbsp;
</div>
<a class="pull-right" href="/pinhfr/MaxCPU/tree/25ba82db26f06f528016f426857fc6717a241392">Browse Files</a>
</div>
</li>

</ul>
<div class='blob-content-holder' id='blob-content-holder'>
<article class='file-holder'>
<div class='file-title'>
<i class="fa fa-file-text-o fa-fw"></i>
<strong>
README.md
</strong>
<small>
123 Bytes
</small>
<div class='file-actions hidden-xs'>
<div class='btn-group tree-btn-group'>
<a class="btn btn-sm" target="_blank" href="/pinhfr/MaxCPU/raw/master/README.md">Raw</a>
<a class="btn btn-sm" href="/pinhfr/MaxCPU/blame/master/README.md">Blame</a>
<a class="btn btn-sm" href="/pinhfr/MaxCPU/commits/master/README.md">History</a>
<a class="btn btn-sm" href="/pinhfr/MaxCPU/blob/c5a070de7a8762393cdfcf3dad9c2a7afe9239bd/README.md">Permalink</a>
</div>
<div class='btn-group' role='group'>
<a class="btn btn-file-option" href="/pinhfr/MaxCPU/edit/master/README.md">Edit</a>
<button name="button" type="submit" class="btn btn-default" data-target="#modal-upload-blob" data-toggle="modal">Replace</button>
<button name="button" type="submit" class="btn btn-remove" data-target="#modal-remove-blob" data-toggle="modal">Delete</button>
</div>

</div>
</div>
<div class='file-content wiki'>
<h1>&#x000A;<a id="maxcpu" class="anchor" href="#maxcpu" aria-hidden="true"></a>MaxCPU</h1>&#x000A;&#x000A;<p>Functional CPU Model within the scope of the lecture "Entwurf digitaler Systeme mit VHDL und SystemC" (TUM SS16)</p>
</div>

</article>
</div>

</div>
<div class='modal' id='modal-remove-blob'>
<div class='modal-dialog'>
<div class='modal-content'>
<div class='modal-header'>
<a class='close' data-dismiss='modal' href='#'>×</a>
<h3 class='page-title'>Delete README.md</h3>
</div>
<div class='modal-body'>
<form class="form-horizontal js-replace-blob-form js-quick-submit js-requires-input" action="/pinhfr/MaxCPU/blob/master/README.md" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="delete" /><input type="hidden" name="authenticity_token" value="9SPd/4DyloNGZitM0L/6XclRylEgD8WUvXSHXcVweZ5n/E6vFZhw6et3v7jxS1zBaRxvX4tr80zI3Uc4Fz+CAA==" />
<div class='form-group commit_message-group'>
<label class="control-label" for="commit_message-869bc593e97829f7e1abca2eef3732d4">Commit message
</label><div class='col-sm-10'>
<div class='commit-message-container'>
<div class='max-width-marker'></div>
<textarea name="commit_message" id="commit_message-869bc593e97829f7e1abca2eef3732d4" class="form-control js-commit-message" placeholder="Delete README.md" required="required" rows="3">
Delete README.md</textarea>
</div>
</div>
</div>

<div class='form-group branch'>
<label class="control-label" for="target_branch">Target branch</label>
<div class='col-sm-10'>
<input type="text" name="target_branch" id="target_branch" value="master" required="required" class="form-control js-target-branch" />
<div class='js-create-merge-request-container'>
<div class='checkbox'>
<label for="create_merge_request-da7f4efac4dad3953d1d93eac3bd5b7c"><input type="checkbox" name="create_merge_request" id="create_merge_request-da7f4efac4dad3953d1d93eac3bd5b7c" value="1" class="js-create-merge-request" checked="checked" />
Start a <strong>new merge request</strong> with these changes
</label></div>
</div>
</div>
</div>
<input type="hidden" name="original_branch" id="original_branch" value="master" class="js-original-branch" />

<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<button name="button" type="submit" class="btn btn-remove btn-remove-file">Delete file</button>
<a class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</a>
</div>
</div>
</form>

</div>
</div>
</div>
</div>
<script>
  new NewCommitForm($('.js-replace-blob-form'))
</script>

<div class='modal' id='modal-upload-blob'>
<div class='modal-dialog'>
<div class='modal-content'>
<div class='modal-header'>
<a class='close' data-dismiss='modal' href='#'>×</a>
<h3 class='page-title'>Replace README.md</h3>
</div>
<div class='modal-body'>
<form class="js-quick-submit js-upload-blob-form form-horizontal" action="/pinhfr/MaxCPU/update/master/README.md" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="put" /><input type="hidden" name="authenticity_token" value="qK2BKjaoj8ux09EqjkI/yUSNz6eO55erp+AudanlVms6chJ6o8JpoRzCRd6vtplV5MBqqSWDoXPSSe4Qe6qt9Q==" />
<div class='dropzone'>
<div class='dropzone-previews blob-upload-dropzone-previews'>
<p class='dz-message light'>
Attach a file by drag &amp; drop or
<a class="markdown-selector" href="#">click to upload</a>
</p>
</div>
</div>
<br>
<div class='alert alert-danger data dropzone-alerts' style='display:none'></div>
<div class='form-group commit_message-group'>
<label class="control-label" for="commit_message-42ad903a45dce6cd07b4d5a4db5aced7">Commit message
</label><div class='col-sm-10'>
<div class='commit-message-container'>
<div class='max-width-marker'></div>
<textarea name="commit_message" id="commit_message-42ad903a45dce6cd07b4d5a4db5aced7" class="form-control js-commit-message" placeholder="Replace README.md" required="required" rows="3">
Replace README.md</textarea>
</div>
</div>
</div>

<div class='form-group branch'>
<label class="control-label" for="target_branch">Target branch</label>
<div class='col-sm-10'>
<input type="text" name="target_branch" id="target_branch" value="master" required="required" class="form-control js-target-branch" />
<div class='js-create-merge-request-container'>
<div class='checkbox'>
<label for="create_merge_request-0451f80e2c383df9df9526a4e1e5d2d6"><input type="checkbox" name="create_merge_request" id="create_merge_request-0451f80e2c383df9df9526a4e1e5d2d6" value="1" class="js-create-merge-request" checked="checked" />
Start a <strong>new merge request</strong> with these changes
</label></div>
</div>
</div>
</div>
<input type="hidden" name="original_branch" id="original_branch" value="master" class="js-original-branch" />

<div class='form-actions'>
<button name="button" type="submit" class="btn btn-small btn-create btn-upload-file" id="submit-all">Replace file</button>
<a class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</a>
</div>
</form>

</div>
</div>
</div>
</div>
<script>
  disableButtonIfEmptyField($('.js-upload-blob-form').find('.js-commit-message'), '.btn-upload-file');
  new BlobFileDropzone($('.js-upload-blob-form'), 'put');
  new NewCommitForm($('.js-upload-blob-form'))
</script>


</div>
</div>
</div>
</div>
</div>



</body>
</html>

