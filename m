Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUcsV-0002Xz-Ny
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 12:54:20 +0200
Received: by wye20 with SMTP id 20so1120340wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 03:51:00 -0700 (PDT)
Received: by 10.216.55.193 with SMTP id k43mr616327wec.51.1307616660300;
	Thu, 09 Jun 2011 03:51:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm765812weq.27.2011.06.09.03.50.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 03:50:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 9 Jun 2011 12:50:57 +0200
Message-Id: <F2ABCA33-0CC1-4583-B929-2ED7E27B8C00@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Moving oe-core GNOME recipes over to meta-gnome
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
X-List-Received-Date: Thu, 09 Jun 2011 10:54:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

There are a number of non-sato GNOME recipes still in oe-core that =
should be moved over to meta-gnome. Metacity is one of those. Could the =
yocto people please draw up a list of the recipes they want to keep in =
oe-core and I will send patches to remove the others.

regards,

Koen=


