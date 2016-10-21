Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E11D171A34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:24:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0gHV52wDz3hjjj;
	Fri, 21 Oct 2016 11:24:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0gHV4cRWzvkkY;
	Fri, 21 Oct 2016 11:24:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 459AbWfSXrqv; Fri, 21 Oct 2016 11:24:37 +0200 (CEST)
X-Auth-Info: aFawxaHGxQaF/fKD068J4e4RrxyYkAk3CU9qb6oI0KN8xNNZAShesDyivoc+nS5n
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 11:24:36 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:24:26 +0000
Message-Id: <1477041868-7097-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: Forgot Signed-off-by lines
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
X-List-Received-Date: Fri, 21 Oct 2016 09:24:39 -0000

I forgot to signoff two of my last patches, so here is a v2 of both
of them.

Olaf Mandel (2):
  combo-layer: handle file_exclude matching dirs
  Remove $COREBASE/LICENSE from LIC_FILES_CHKSUM

-- 
2.1.4


