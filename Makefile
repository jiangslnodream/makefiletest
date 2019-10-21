#windows

# 可执行文件名
EAECUTABLE_DIR := bin
EXECUTABLE     := main

# top dir
TOP_DIR    ?= .

# 头文件目录
INCLUDES   := $(TOP_DIR) hello world

# 除了当前目录外，其他的源代码文件目录
SRCDIR     := hello world
OBJS_DIR   := objs

#LIBDIR     :=               # 静态库目录
#LIBS       :=               # 静态库文件名

#
CC:=g++
CFLAGS := -g -Wall -O3
CPPFLAGS := $(CFLAGS)
CPPFLAGS += $(addprefix -I,$(INCLUDES))
#CPPFLAGS += -MMD

#
SRCS := $(wildcard *.cpp) $(wildcard $(addsuffix /*.cpp, $(SRCDIR)))
OBJS := $(patsubst %.cpp, %.o, $(SRCS))

all: prepare $(EXECUTABLE)

prepare : 
	mkdir $(EAECUTABLE_DIR)
	mkdir $(OBJS_DIR)
	echo $(SRCS)
	echo $(OBJS)

$(EXECUTABLE) : $(OBJS)
	$(CC) -o $(EAECUTABLE_DIR)/$(EXECUTABLE) $(addprefix $(OBJS_DIR)/, $(notdir $(OBJS)))
	
%.o : %.cpp
	$(CC) -o $(OBJS_DIR)/$(notdir $@) -c ${CPPFLAGS} $^

FILE = objs

clean:
	rmdir /S /Q $(notdir $(OBJS_DIR))
	rmdir /S /Q $(notdir $(EAECUTABLE_DIR))