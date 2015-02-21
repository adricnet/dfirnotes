import volatility.plugins.common as common 
import volatility.utils as utils
import volatility.win32.tasks as tasks

class PsCSV(common.AbstractWindowsCommand):
    """Process List with CSV output"""

    def calculate(self):
        kernel_space = utils.load_as(self._config) 

        for process in tasks.pslist(kernel_space):
            yield process

    def render_text(self, outfd, data):
        self.table_header(outfd, [("Offset", "[addrpad]"),
                                  ("Process", "20"),
                                  ("Pid", "8"),
                                  ("Created", "[DateTime]")])
        for process in data:
            self.table_row(outfd, process.obj_offset, 
                                  process.ImageFileName, process.UniqueProcessId, process.CreateTime)

    def render_csv(self, outfd, data):
#        self.table_header(outfd, [("Offset", "[addrpad]"),
#                                  ("Process", "20"),
#                                  ("Pid", "8"),
#                                  ("Created", "20")])
        print("Offset,Process,Pid,Created")
        for process in data:
            outfd.write("{0:#x},{1},{2},{3}\n".format(process.obj_offset, process.ImageFileName, process.UniqueProcessId, process.CreateTime))
