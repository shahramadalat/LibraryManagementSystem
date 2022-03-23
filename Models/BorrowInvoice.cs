using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.Models
{
    internal class BorrowInvoice
    {
        public int BorrowId { get; set; }
        public int? BookId { get; set; }
        public int? BorrowInvoiceId { get; set; }
        public int PersonId { get; set; }
        public string BookName { get; set; }
        public int Quantity { get; set; }
        public string? FullName { get; set; }
        public DateTime? Date { get; set; }
        public DateTime? ReturenDate { get; set; }
        public bool IsReturned { get; set; }
        public int AccountId { get; set; }
        public string Employee { get; set; }

    }
}
