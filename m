Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TcSdD-0008GI-Pc
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Nov 2012 04:11:43 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4757700lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 18:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=6nQziep3cx9MbPFJVbRwCs1MLnt6gXDdZrTmLzrk6Nw=;
	b=AWxYt0pm5viWMPhUGQ+fUmHmIrIvpEGeKrOHSqaGihQUqh4pF+vKvgYf33xmd8EeYa
	wrBJnu3cCHEQ1TNsicipMiBnvPEUgggYMe+dGh8qbFz8j6drPz6J8cNP0wkiqYDxNC/Z
	lIrPA0zZ5bFbrnpT5rZxPUuu5bsJvFyJ66dyLJSMx4r/As1KCHng5anCWenioYan8p3h
	d3b2bTlGY7xHLWRlaTqRUI48cTg1Q73jPZ2wBP504DqVWUFovqwr5Dt9FBHTadxOcugr
	vv6nss+a9/JXr7aqf8de5vxifLjU14w2HkEjinqnqnAwpaq+BRgM1N+F3szOP/dj+A9C
	Q2/w==
Received: by 10.152.110.74 with SMTP id hy10mr7287579lab.54.1353812253837;
	Sat, 24 Nov 2012 18:57:33 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id oj5sm3844955lab.8.2012.11.24.18.57.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Nov 2012 18:57:33 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TcSPS-00057c-PQ
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Nov 2012 04:57:30 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2012 04:57:21 +0200
Message-Id: <1353812242-27313-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] automake: update to upstream version 1.12.5 [V2]
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
X-List-Received-Date: Sun, 25 Nov 2012 03:11:43 -0000


- Set PR to r0, and not to r1


