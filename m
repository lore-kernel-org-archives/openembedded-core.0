Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QbwpT-0000Ei-6f
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 17:37:27 +0200
Received: (qmail invoked by alias); 29 Jun 2011 15:27:05 -0000
Received: from p5B0A22BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.189]
	by mail.gmx.net (mp072) with SMTP; 29 Jun 2011 17:27:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/GBgcxfAvG8nAWBG/fVlscogPJVV8+G3rz0e/vDP
	pOA6xFcZkv3NQK
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 17:28:45 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201106291728.47032.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: In which meta/layer is a home for not yet supported machines
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
X-List-Received-Date: Wed, 29 Jun 2011 15:37:27 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

just started to collect first oe-core experiences and would like to get the 
hardware on my (or friend's) desk supported. To check already available I did

find -name "*.conf" | grep machine

and miss

o gumstix overo ( http://www.gumstix.com/store/index.php?cPath=33 )
o tx28 ( http://www.karo-electronics.com/tx28.html / have prepared support for 
oe but would like to get this to oe-core )
o mx28evk ( 
http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MCIMX28EVKJ&fr=g 
)

In which meta/layer is the first place for configurations/bootloader/kernels?

Regards

Andreas


