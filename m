Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjpjg-0001Yw-UE
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 12:16:56 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1978426bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 03:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=4NMCfbVTK3FI0NtVE3YiV9GI8IiBHun1coosDEuHoZI=;
	b=jh1HD0DHxhOFpmFzTPWoTmVQ2bnLmI1Gb8XrS+cMWDsBDynmsMTKKLgHMfs6iM/9G0
	mgsAb9MofJj9gK7zt4gNGRlhpo7gpbzJxvdzbkLiNm2j+gKW4D/+aL3cQ1EOo7Fl2WUO
	JYVOgzrptjHkPQ4bDTm3n+jPL3+Q64xpijRUGHAcM/WTc8mDT2etR+q2Evc/++nBEX2J
	l9B5Gfg1zuU+E9EyUREKMJ50lAyq8eCTHj6YiiJg3CPclYImwh2PP6QGxeYBkYqZjjKh
	nZ0DnExXjOXT6/j3Sv+8XvWSrPVNJKkFnvHq2Q6rhgcgtjmjqgYurqel91LOPlDLswPO
	0gJw==
Received: by 10.204.147.78 with SMTP id k14mr3781969bkv.7.1355569335333;
	Sat, 15 Dec 2012 03:02:15 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id d16sm6149105bkw.2.2012.12.15.03.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 03:02:14 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TjpVT-000187-NT
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 13:02:11 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 13:02:07 +0200
Message-Id: <1355569328-4307-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Coreutils update
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
X-List-Received-Date: Sat, 15 Dec 2012 11:16:57 -0000

coreutils-8.19 seems not to suffer from the problems that
caused me to drop update all the way to 8.20. Update that
far.


 - ML


