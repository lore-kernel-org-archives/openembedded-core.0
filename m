Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1Rf7FZ-0006V0-KU
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 10:53:46 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Mon, 26 Dec 2011 17:46:31 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Mon, 26 Dec 2011
	17:46:27 +0800
Message-ID: <1324892695.4637.10.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2011 17:44:55 +0800
Organization: Insigma
X-Mailer: Evolution 3.2.2 
MIME-Version: 1.0
Subject: can't install eclipse plugin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Dec 2011 09:53:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hello, all:
I have update yocto plugin to 20111224 current version, but can't
install it correctly.

I don't know where to find linuxtools.tmf.core, I have installed
linuxtools totaly, but can't work.

who can help me? thanks!



Cannot complete the install because one or more required items could not
be found.
  Software being installed: Yocto Plugin for Eclipse 1.1.0.201112240640
(org.yocto.sdk.feature.group 1.1.0.201112240640)
  Missing requirement: Yocto Project Plugin Remote Tools
1.1.0.201112240640 (org.yocto.sdk.remotetools 1.1.0.201112240640)
requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could not
be found
  Cannot satisfy dependency:
    From: Yocto Plugin for Eclipse 1.1.0.201112240640
(org.yocto.sdk.feature.group 1.1.0.201112240640)
    To: org.yocto.sdk.remotetools 0.0.0


-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



