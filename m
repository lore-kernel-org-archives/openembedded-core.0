Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1QwURn-00073a-Ac
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 09:33:55 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 25 Aug 2011 15:28:23 +0800
Received: from [192.168.0.102] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 25 Aug 2011
	15:28:20 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 15:28:46 +0800
In-Reply-To: <cover.1314246387.git.bruce.ashfield@windriver.com>
References: <cover.1314246387.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.0.2 
Message-ID: <1314257326.1332.45.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: does it support mercurial?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 25 Aug 2011 07:33:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like the bitbake support 'hg' fetcher, but when building custom
package, it said need "mercurial-native", but there is no "mercurial"
package in recipes-devtools, of cause, I installed mercurial on host pc.

Does anyone can confirm this problem???



--=20
Yi Qingliang
=E5=80=AA=E5=BA=86=E4=BA=AE

Insigma




