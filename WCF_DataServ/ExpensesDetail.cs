//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WCF_DataServ
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExpensesDetail
    {
        public int ReportId { get; set; }
        public string SubmittedBy { get; set; }
        public string RegionName { get; set; }
        public decimal SalesTarget { get; set; }
        public decimal SalesAchieved { get; set; }
        public decimal SalesDifference { get; set; }
        public int Expenses { get; set; }
        public Nullable<bool> Approved { get; set; }
    }
}
