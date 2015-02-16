$(document).on("click", ".logout-link", function() {
    CQ_Analytics.ProfileDataMgr.clear();
});

$(document).on("submit", ".login-form", function() {
    CQ_Analytics.ProfileDataMgr.clear();
});