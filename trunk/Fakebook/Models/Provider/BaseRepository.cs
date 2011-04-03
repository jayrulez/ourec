using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Fakebook.Models.Provider
{
    public class BaseRepository
    {
		protected Entities dbContext;
		
		public BaseRepository(Entities context)
		{
			if(context == null)
			{
				throw new ArgumentNullException("context");
			}
			
			this.dbContext = context;
		}
    }
}
