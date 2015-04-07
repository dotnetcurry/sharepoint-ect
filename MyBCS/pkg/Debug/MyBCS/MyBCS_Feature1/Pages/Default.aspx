<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-2.1.1.min.js"></script>

    
     <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>

    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <script src="../Scripts/knockout-3.2.0.js" type="text/javascript"></script>
   
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />



    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    External Content Types with Business Connectivity Services (BCS)
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <table id="tblMain">
        <tr>
            <td>
                <table id="tblRecordView">
                    <tr>
                        <td>
                           Submitted By:
                       </td>
                        <td>
                            <input type="text" id="submittedBy" class="c1" data-bind="value: $root.SubmittedBy"/>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           Region:
                       </td>
                        <td>
                            <input type="text" id="regionName" class="c1" data-bind="value: $root.RegionName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Actual Sales Target:
                       </td>
                        <td>
                            <input type="text" id="actualSalesTarget" class="c1" data-bind="value: $root.SalesTarget"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                           Achieved Sales Target:
                       </td>
                        <td>
                            <input type="text" id="achievedSalesTarget" class="c1" data-bind="value: $root.SalesAchieved"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          Difference Sales Target:
                       </td>
                        <td>
                            <input type="text" id="differenceSalesTarget" class="c1" data-bind="value: $root.SalesDifference"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                          Expenses Made:
                       </td>
                        <td>
                            <input type="text" id="expensesMade" class="c1" data-bind="value: $root.Expenses"/>
                        </td>
                    </tr>

                     <tr>
                        <td>
                          Status (Approved/Rejected):
                       </td>
                        <td>
                            <input type="text" id="status" class="c1" data-bind="value: $root.Approved"/>
                        </td>
                    </tr>
                   <tr>
                       <td>
                           <input type="button" id="new" value="New" data-bind="click:$root.clearEntries"/>
                       </td>
                       <td>
                           <input type="button"
                                id="submitReport" value="Submit Report"  data-bind="click: $root.submitReport"/>
                       </td>
                   </tr>
                </table>
            </td>

            <td>
                <div id="dvListView">
                    <table id="tblListView">
                        <thead>
                            <tr>
                                <td>ReportId</td>
                                <td>Submited By</td>
                                <td>Region Name</td>
                                <td>Actual Sales Target</td>
                                <td>Achieved Sales Target </td>
                                <td>Difference </td>
                                <td>Expenses</td>
                                <td>Status(Approved/Rejected)</td>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach:Reports">
                            <tr>
                                <td><span data-bind="text:ReportId"></span></td>
                                <td><span data-bind="text:SubmittedBy"></td>
                                <td><span data-bind="text:RegionName"></td>
                                <td><span data-bind="text:SalesTarget"></td>
                                <td><span data-bind="text:SalesAchieved"></td>
                                <td><span data-bind="text:SalesDifference"></td>
                                <td><span data-bind="text:Expenses"></td>
                                <td><span data-bind="text:Approved"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                 
            </td>
        </tr>
    </table>
    <div>
        <span data-bind="text:errorMessage"></span>
    </div>


</asp:Content>
