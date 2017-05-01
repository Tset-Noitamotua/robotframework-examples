import sys  
from robotremoteserver import RobotRemoteServer  
from org.sikuli.script import *  
  
class SikuliRemoteLibrary:  
  
    def __init__(self):  
        self.SS = Screen()  
        self.PT = Pattern()  
  
    def _wait(self, imgFile, timeOut, similarity):  
		try:  
			self.PT = Pattern(imgFile)  
			self.PT = self.PT.similar(float(similarity))  
			self.SS.wait(self.PT, float(timeOut))  
		except FindFailed, err:  
			print "ERR: _wait"  
			raise AssertionError(err)  
  
    def click_object(self, imgFile, timeOut, similarity):  
		try:  
			self._wait(imgFile, timeOut, similarity)  
			self.SS.click(imgFile)  
		except FindFailed, err:  
			raise AssertionError("Cannot click [" + imgFile + "]")  
  
    def object_exists(self, imgFile, similarity, timeOut):  
		try:  
			self._wait(imgFile, timeOut, similarity)  
		except FindFailed, err:  
			raise AssertionError("Could not find [" + imgFile + "]")  
  
    def type_at_object(self, imgFile, txt, timeOut, similarity):  
		try:  
			self._wait(imgFile, timeOut, similarity)  
			self.SS.type(imgFile, txt)  
		except FindFailed, err:  
			raise AssertionError("Cannot type at [" + imgFile + "]")  
  
    def paste_at_object(self, imgFile, txt, timeOut, similarity):  
		try:  
			self._wait(imgFile, timeOut, similarity)  
			self.SS.paste(imgFile, txt)  
		except FindFailed, err:  
			raise AssertionError("Cannot paste at [" + imgFile + "]")  
  
if __name__ == '__main__':  
    SRL = SikuliRemoteLibrary()  
    RobotRemoteServer(SRL, *sys.argv[1:])