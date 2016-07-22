Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB74606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 10:35:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2016 03:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="738210862"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2016 03:35:08 -0700
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.72.170]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4BEE06A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 03:34:58 -0700 (PDT)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2016 13:35:28 +0300
Message-Id: <1469183729-8859-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Fri, 22 Jul 2016 10:35:08 -0000


As discussed offline with Joshua, Updated the patch to make the stateless
user home folder as build config option(--disable-stateless-home). 
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


