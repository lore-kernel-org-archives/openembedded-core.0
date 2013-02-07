Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1U3a0t-0008H2-Sn
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:32:29 +0100
Reinject: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob104.postini.com ([207.126.147.11]) with SMTP
	ID DSNKURQnuELOVA003DVDw1vbtxQzm21/77zI@postini.com;
	Thu, 07 Feb 2013 22:16:25 UTC
Reinject: from eu1sys200aog107.obsmtp.com (eu1sys200aob107.obsmtp.com
	[207.126.144.122])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22591136
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2013 13:28:12 +0000 (GMT)
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob107.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUROr6muhly9WGL4emQ8HLH8fyQylSEQ4@postini.com;
	Thu, 07 Feb 2013 13:28:12 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F410183;
	Thu,  7 Feb 2013 13:27:56 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B66D4499E;
	Thu,  7 Feb 2013 13:27:55 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AXB03101 (AUTH condorg); Thu, 7 Feb 2013 14:27:55 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 14:27:54 +0100
Message-ID: <0c6601ce0536$eff46ff0$cfdd4fd0$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac4FNu3ocztF7hEqTj6uL4leif4svA==
Subject: Bitbake 1.17.1 tar file not available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 22:32:29 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: it

Hi All,

Today I pulled changes in local from OE-Core master repository.
Running a build I'm failing because bitbake 1.71.1 is requested and I've the
1.17.0 instead.
The tar file is not yet available looking at the openemebedded site.
Do I have to clone also bitbake to have the bsf sources? Honestly I want to
avoid this as already
made since now, I prefer to have the stable tar file instead.

Please can you help me?
Cheers,
Giuseppe



