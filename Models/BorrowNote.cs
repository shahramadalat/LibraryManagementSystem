using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.Models
{
    internal class BorrowNote
    {
        public int BorrowId { get; set; }
        public int? BookId { get; set; }
        public string BookName { get; set; }
        public int Quantity { get; set; }
    }
}
