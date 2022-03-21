using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.Models
{
    internal class LibraryInvoiceModel
    {
        public int LibraryId { get; set; }
        public int? LibraryInvoiceId { get; set; }
        public int BookId { get; set; }
        public string? BookName { get; set; }
        public int Quantity { get; set; }
        public int BookPrice { get; set; }
        public int Total { get; set; }
        public DateTime? Date { get; set; }
        public string FullName { get; set; }
    }
}
