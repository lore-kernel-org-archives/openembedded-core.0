Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1441D601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 09:33:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5P9XFbf018139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2013 02:33:15 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 25 Jun 2013 02:33:14 -0700
Message-ID: <51C963C0.5020009@windriver.com>
Date: Tue, 25 Jun 2013 17:32:48 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: oe-core <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.205]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Could qt4.8 build on mips 64 bits platform?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2013 09:33:17 -0000
Content-Type: multipart/alternative;
	boundary="------------090705040201090806020904"

--------------090705040201090806020904
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Could qt4.8 build on mips 64 bits platform?

I searched qt-project.org and no such related information.
And then grep the source codethat no such mips64 keyword in file 
qmake.conf under directory mkspecs. In contrast there are mips32 related 
flags in mkspecs/qws/linux-mips-g++/qmake.conf.

Does that mean we still can't build qt 4.8 on mips64?

Thanks a lot.

-- 
Regards,
Neil | Kai Kang


--------------090705040201090806020904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="+1">Hi All,<br>
      <br>
      <font size="+1"><font size="+1"></font></font>Could qt4.8 build on
      mips 64 bits platform?<br>
      <br>
      <font size="+1">I sear<font size="+1">ched qt-project.org <font
            size="+1">and no such re<font size="+1">lated information. <br>
              And then g<font size="+1">rep the source code<font
                  size="+1"> that no such <font size="+1">mips<font
                      size="+1">64 <font size="+1">keywor<font
                          size="+1">d in file qmake.conf <font
                            size="+1">under directory</font> mkspe</font></font></font></font></font></font></font></font></font></font>cs.
      <font size="+1">In <font size="+1">contra<font size="+1">st there
            are mips32 related flags in <font size="+1">m<font
                size="+1">kspecs</font></font>/qws/linux-mips-g++/qmake.conf</font></font></font>.<br>
      <br>
      <font size="+1"><font size="+1">Does <font size="+1">that mean we
            still can't build <font size="+1">qt 4.8 on mips64?<br>
              <br>
              <font size="+1">Than<font size="+1">ks a lot.</font></font><br>
            </font></font></font></font></font>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090705040201090806020904--
