Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1Qx9kq-00071X-GI
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 05:40:20 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7R3ZUNt029375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:30 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R3ZTK6000774
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:29 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R3ZTcB007129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:29 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 26 Aug 2011 22:35:29 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7R3ZNoV000410	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:29 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 22:26:16 -0500
Message-ID: <1314415580-21925-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: (No subject)
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
X-List-Received-Date: Sat, 27 Aug 2011 03:40:20 -0000
Content-Type: text/plain

v2 Changes:
Addressing Koen's feedback on patches
* Added a PR to all recipes
* Changed meta-ti in subject to meta-oe

Patches in the series:

[PATCH v2 meta-oe 1/4] gedit: Imported from OE classic
[PATCH v2 meta-oe 2/4] gtksourceview: Imported from OE classic
[PATCH v2 meta-oe 3/4] libgnomecups: Imported from OE Classic
[PATCH v2 meta-oe 4/4] libgnomeprint: Imported from OE classic


