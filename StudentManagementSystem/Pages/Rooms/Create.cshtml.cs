using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using StudentManagementSystem.Models;

namespace StudentManagementSystem.Pages.Rooms
{
    public class CreateModel : PageModel
    {
        private readonly StudentManagementSystem.Models.PRN221_StudentManagementSystemContext _context;

        public CreateModel(StudentManagementSystem.Models.PRN221_StudentManagementSystemContext context)
        {
            _context = context;
        }
        public IActionResult OnGet()
        {

            return Page();
        }

        [BindProperty]
        public Room room { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid || _context.Rooms == null || _context.Rooms == null)
            {
                return Page();
            }

            _context.Rooms.Add(room);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");

        }
    }
}