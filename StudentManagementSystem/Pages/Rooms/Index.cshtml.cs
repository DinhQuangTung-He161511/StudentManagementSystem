using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using StudentManagementSystem.Models;

namespace StudentManagementSystem.Pages.Rooms
{
    public class IndexModel : PageModel
    {
        private readonly PRN221_StudentManagementSystemContext _context;


        public IndexModel(PRN221_StudentManagementSystemContext context)
        {
            _context = context;
        }
        public IList<Room> Rooms { get; set; } = default!;
        [BindProperty(SupportsGet = true, Name = "ipp")]
        public int ItemsPerPage { get; set; } = 15;
        //public const int ITEMS_PER_PAGE = 10;
        [BindProperty(SupportsGet = true, Name = "p")]

        public int currentPage { get; set; }

        public int countPages { get; set; }

        public async void OnGetAsync()
        {
            if (_context.Rooms != null)
            {
                Rooms = await _context.Rooms.ToListAsync();
            }
            int totalRooms = await _context.Rooms.CountAsync();
            ViewData["TotalRoom"] = totalRooms;
            countPages = (int)Math.Ceiling((double)totalRooms / ItemsPerPage);
            if (currentPage < 1)
            {
                currentPage = 1;
            }
            if (currentPage > countPages)
                currentPage = countPages;
            currentPage = Math.Max(currentPage, 1);
            /*Majors = await _context.Majors
               .OrderBy(s => s.MajorId)
               .Skip((currentPage - 1) * ItemsPerPage)
               .Take(ItemsPerPage)
               .ToListAsync();*/
        }
    }
}