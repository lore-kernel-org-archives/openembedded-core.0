Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id E9088789FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id 7B1A2205CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:57 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9l4pldDiheo1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:56 +0000 (UTC)
Received: from localhost.localdomain
	(host70-5-dynamic.16-79-r.retail.telecomitalia.it [79.16.5.70])
	by sysam.it (Postfix) with ESMTPSA id 5DCE3205C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:56 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 15:29:49 +0200
Message-Id: <20181004132953.3568-1-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
Subject: (No subject)
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
X-List-Received-Date: Thu, 04 Oct 2018 13:29:57 -0000


This patch serie adds initial support for m68k architecture.
A Linux kernel build has been tested successfully using a local
meta layer, or kernel-yocto. 

