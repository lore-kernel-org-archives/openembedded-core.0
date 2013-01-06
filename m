Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrxZ8-0003BU-Cz
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 22:15:36 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so13750916lab.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 13:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=ld2z1xdRtBcJg6K0Ys1UBbuvG44nGAbW3k+jpBXQ7XA=;
	b=b+hApZpXMvNirWBX66uOKjJ4U8WS/6TOAfFzrzGsOpe2hCSabFITssDsGREQcAa8yk
	IaAGK0wgkhK+cX6T0t1wWVa8q28VToUPMo7VUK+mEiofBNjeD+aJxbd2E94CgZZOME2J
	HsnkUo2yZPA3KdSI6kX0ilK7nBTqQEG6qboZMKflU7rWXICN4UGwqD4mQmMpL5u0WRFS
	D/5SvtMa+VVAifBhsGtdIfuK80RoacUJzwpoz/VThOQPVc/jiwQxIx41SLVdOTL9NYVf
	ZsC4RxucXYeRfSGwA32Xxm7M4AGucvZT6PxwCE9WmU/Kg9X7AJdoFnLEcqnZiaM/7oXf
	FoLg==
X-Received: by 10.152.145.8 with SMTP id sq8mr55434458lab.21.1357506025916;
	Sun, 06 Jan 2013 13:00:25 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id er8sm20141244lbb.9.2013.01.06.13.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 13:00:25 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TrxKP-0000t2-9J
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 23:00:21 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2013 22:59:49 +0200
Message-Id: <1357505990-3365-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: prelink update to automake-1.13 compatibility
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
X-List-Received-Date: Sun, 06 Jan 2013 21:15:36 -0000

Mark updated prelink git with automake-1.13 fix, I've made
testbuilds of updated version in openembeded with automake-1.13.1
and automake-1.12.6.


 - ML


