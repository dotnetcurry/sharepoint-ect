/// <reference path="jquery-2.1.1.min.js" />
/// <reference path="knockout-3.2.0.js" />


'use strict';

var SPHostUrl;
var SPAppWebUrl;

// read URL parameters
function retrieveQueryStringParameter(param) {
    var params = document.URL.split("?")[1].split("&");
    var strParams = "";
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split("=");
        if (singleParam[0] == param) {
            return singleParam[1];
        }
    }
}


SPAppWebUrl = decodeURIComponent(retrieveQueryStringParameter("SPAppWebUrl"));
SPHostUrl = decodeURIComponent(retrieveQueryStringParameter("SPHostUrl"));


$(document).ready(function () {

    var viewmodel = new expensesDetailsModel();

    ko.applyBindings(viewmodel);

    viewmodel.loadReports();

});



var expensesDetailsModel = function () {

    var self = this;
    self.Reports = ko.observableArray([]);
    self.errorMessage = ko.observable();

    self.ReportId = ko.observable(0);
    self.SubmittedBy = ko.observable("");
    self.RegionName = ko.observable("");
    self.SalesTarget = ko.observable(0.0);
    self.SalesAchieved = ko.observable(0.0);
    self.SalesDifference = ko.observable(0.0);
    self.Expenses = ko.observable(0.0);
    self.Approved = ko.observable("");


    //Function to Load All Expenses Records
    self.loadReports = function(){

        var url = _spPageContextInfo.webServerRelativeUrl + "/_api/lists/getbytitle('ExpensesDetails')/items";
         
        $.ajax({
            url: url,
            type: "GET",
            headers: {
                "Accept": "application/json;odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val()
            }
        }).done(function (resp) {
            alert("Success");
            self.Reports(resp.d.results);

        }).error(function (err) {

            self.errorMessage("Some Error Occures " + err.status + "  " + err.success);
        });
    }
    self.clearEntries = function () {

      self.SubmittedBy("");
      self.RegionName("");
      self.SalesTarget(0.0);
      self.SalesAchieved(0.0);
      self.SalesDifference(0.0);
      self.Expenses(0.0);
      self.Approved(false);
    }

    //Function to Submit the new Expense Record
    self.submitReport = function () {

        var url = _spPageContextInfo.webServerRelativeUrl + "/_api/lists/getbytitle('ExpensesDetails')/items";

        var diff = self.SalesAchieved() - self.SalesTarget();

        diff = diff.toString();

        if (diff > 5000 && self.Expenses() < 5000) {
            self.Approved(true);
        }
        else {
            self.Approved(false);
        }

        self.SalesDifference(diff);

        var itemType = "SP.Data.ExpensesDetailsListItem";

        var expensesDetails = {
            "__metadata": { "type": itemType },
            "SubmittedBy": self.SubmittedBy(),
            "RegionName": self.RegionName(),
            "SalesTarget": self.SalesTarget(),
            "SalesAchieved": self.SalesAchieved(),
            "SalesDifference": self.SalesDifference(),
            "Expenses": self.Expenses(),
            "Approved" : self.Approved()
        };

        $.ajax({
            url: url,
            type: "POST",
            data: ko.toJSON(expensesDetails),
            headers: {
                "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                "accept": "application/json;odata=verbose",
                "content-type": "application/json;odata=verbose",
              "content-length": expensesDetails.length
            }
        }).done(function (resp) {
            alert("Success 1" + resp.d.results);
            self.ReportId(resp.d.results);

            self.loadReports();

        }).error(function (err) {
            self.errorMessage("Some Error Occures " + err.status + "  " + err.statusText);
        });
    }
};

