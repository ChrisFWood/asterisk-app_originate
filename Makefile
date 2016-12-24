CC = gcc

CP = cp

CFLAGS = -pipe -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -g3 -D_REENTRANT -D_GNU_SOURCE -O2 -march=native -mtune=native -fomit-frame-pointer -Wno-missing-prototypes -Wno-missing-declarations -DCRYPTO -fPIC -c -o app_originate.o 

INCLUDES = -I/usr/include

INSTALL = /usr/lib/asterisk/modules/

LFLAGS = -shared -Xlinker -x

SRCS = app_originate.c

OBJS = $(SRCS:.c=.o)

MAIN = app_originate

.PHONY: clean

all:	$(MAIN)

$(MAIN):
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OBJS) $(SRCS)
	$(CC) $(LFLAGS) -o $(MAIN).so $(OBJS)

install:
	$(CP) $(MAIN).so $(INSTALL)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN).so
