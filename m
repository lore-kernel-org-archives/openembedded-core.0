Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0D8-0006m1-6H
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:02 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so14008192lab.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=4eUQ1O84hmC6I6SynogVQQtAR82byKQbT37opOsPJjU=;
	b=qfan2rDW3rELxkj/TPhkSdU8KC0aU/f/7Q2Lw1gm3bOQzt5/D+uG+mdLZdxAGlDucH
	YuYeq8ize/hXmAN1u83DyQaycAc8CCDOGd1MV9uNx+zbhFnO8EEVJuCsW3yR3WJfTOYn
	nJMf+zJomH17R2q4zuNQbd0GpTYyzRV6889yuDbvuTXcCY7QDlqTFPTb8j6bDTw2RCsZ
	RlhwS9BB/Ntw3EobWZmA9ndEedia5D1WOH6j8sCAwp8sRI7yvcahpb1nlL6/OLzlekNS
	4iKsMpDvzhqKH0/b4kffC6j3BMInKqNtD/HQARAH1c8FEs9eER7J2XYDNFkyeN6zD/Gb
	q5ZQ==
X-Received: by 10.112.99.2 with SMTP id em2mr15429047lbb.11.1357516193524;
	Sun, 06 Jan 2013 15:49:53 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ee5sm20240460lbb.14.2013.01.06.15.49.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:52 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TrzyK-0001PD-20
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:49:44 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:26 +0200
Message-Id: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Prepare recipes for automake-1.13 (batch 1 / v2)
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:02 -0000

* Fixes and updates to Upstream-Status entries.

[PATCH v2 01/15] pkg-config: replace obsolete automake macros with
[PATCH v2 02/15] libtool: remove help2man dependency
[PATCH v2 03/15] bison: remove help2man dependency
[PATCH v2 04/15] file: replace obsolete automake macros with working
[PATCH v2 05/15] popt: disable tests
[PATCH v2 06/15] glib-2.0: replace obsolete automake macros with
[PATCH v2 07/15] libx11: disable tests
[PATCH v2 08/15] libpng: replace obsolete automake macros with
[PATCH v2 09/15] libusb: replace obsolete automake macros with
[PATCH v2 10/15] pixman: replace obsolete automake macros with
[PATCH v2 11/15] libid3tag: replace obsolete automake macros with
[PATCH v2 12/15] libgcrypt: replace obsolete automake macros with
[PATCH v2 13/15] gnutls: replace obsolete automake macros with
[PATCH v2 14/15] libtasn1: remove help2man dependency
[PATCH v2 15/15] flac: replace obsolete automake macros with working


 - ML


