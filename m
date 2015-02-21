Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Feb 2015 18:34:33 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id C3A776E614
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 18:34:33 +0000 (UTC)
Received: from aragorn.auenland.lan ([95.90.138.233]) by mail.gmx.com
	(mrgmx102) with ESMTPSA (Nemesis) id 0MIhDo-1YN1sY0Ev2-002D2e;
	Sat, 21 Feb 2015 19:29:30 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 19:27:23 +0100
Message-ID: <1759659.lAWupvIXx1@aragorn.auenland.lan>
Organization: priv
User-Agent: KMail/4.14.4 (Linux/3.17.0-rc51-js2-00622-geae7382; KDE/4.14.4;
	x86_64; ; )
MIME-Version: 1.0
X-Provags-ID: V03:K0:E4ZySErxBxMu032jDTGtyN2jqezjmT5Y2mL2Pv4kaHejQ6DtDXr
	QqqZBUxXLyyqFPLQYMsYoNSquUiAXDevuZu3sO92+Qu6K1RHHZn6rt0vUXjI/K5V4nxuk7o
	5shl6HMiVTNWvZHaDzgD9HA4nUwW+DIob3XpAlIS/pPSWD3onMHATiVDD+5JnXQOOPGv5xG
	IhH7vCWWexn3rc+3QhJ5g==
X-UI-Out-Filterresults: notjunk:1;
Subject: Question about PR_SERVICE
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
X-List-Received-Date: Sat, 21 Feb 2015 18:34:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi !

Do I need to set anything else than PRSERV_HOST="somehost:someport" in 
local.conf (and start the prserv of course on somehost) ? 

I see no change in the prserv logfile and no size change for the prserv.sqlite 

Do I miss an option on the local.conf?

Best,
Jan-Simon

