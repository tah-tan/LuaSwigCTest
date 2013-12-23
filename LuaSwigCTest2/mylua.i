
%module mylua

%{

static void swap(int *px, int *py) {
	int t = *px;
	*px = *py;
	*py = t;
}

static void base (int *pData, int num, int offset) {
	int i;
	for (i = 0; i < num; i++) {
		pData[i] = i + offset * 2;
	}
}

static void array_write(int *pData, int num) {
	base(pData, num, 0);
}

static void array_write3(int *pData, int num, int offset) {
	base(pData, num, offset);
}

static void array_write4(int offset, int *pData, int num) {
	base(pData, num, offset);
}

static void array_write7(unsigned long *pdwData, int iNum) {
	int iLoop;
	for (iLoop = 0; iLoop < iNum; iLoop++) {
		pdwData[iLoop] = iLoop * 10;
	}
}

static int array_write8(short *pnData, int iNum) {
	int iloop;
	for (iloop = 0; iloop < iNum; iloop++) {
		pnData[iloop] = iloop * 2;
	}
	return 100;
}
%}

%include <typemaps.i>

%apply int* INOUT {int *px, int *py};
void swap(int *px, int *py);

%apply (unsigned long *INOUT, int) {(unsigned long *pdwData, int iNum)};
void array_write7(unsigned long *pdwData, int iNum);

%apply (short *INOUT, int) {(short *pnData, int iNum)};
int array_write8(short *pnData, int iNum);

%apply (int *INOUT, int) {(int *pData, int num)};
void array_write(int *pData, int num);
void array_write3(int *pData, int num, int offset);
void array_write4(int offset, int *pData, int num);



