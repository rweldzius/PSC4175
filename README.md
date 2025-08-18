# PSC 4175: Introduction to Data Science

## Prof. Ryan Weldzius

The repository for the Hugo/Blogdown site for the course PSC 4175: Introduction to Data Science. Prof. Weldzius is teaching this course at Villanova University in Fall 2025.

The architecture and framework of this site were borrowed and appropriated from [Matthew Blackwell](https://mattblackwell.org/). His course on Data Analysis and Politics
can be found here: [https://gov51.mattblackwell.org/]().

This site uses the Academic Hugo theme by the [https://github.com/orgs/HugoBlox/repositories](HugoBlox). The themes section of the repository had to be copied form Prof. Blackwell's site's repository, as hugo-academic repository is changed and upgraded.

Starting with Hugo v0.123.0, the `.Site.GoogleAnalytics` variable was removed. This causes a build error in themes like Hugo Academic/Wowchemy when they try to access it in the `google_analytics.html` partial. To fix this, we simply commented out the line that includes the Google Analytics partial in `partials/site_head.html`. If you need Google Analytics, add the theme into the directory as submodule.

There are multiple changes in the templates within the `themes/hugo-academic/layouts`, as well addition of layouts into `layouts/` and relevant files into `asssets/`.
