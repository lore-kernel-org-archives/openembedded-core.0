Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 755 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Feb 2017 13:59:28 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 423C171A74;
	Fri, 10 Feb 2017 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=241; q=dns/txt; s=iport;
	t=1486735170; x=1487944770;
	h=from:subject:to:cc:message-id:date:mime-version:
	content-transfer-encoding;
	bh=oA+2XOQgn97116f8WJD0Q5MxFNEnStzE7m8nYb/AxiE=;
	b=RpGoXFW17erZqogCgPBlZ5ksWQlPsLAvPlOe2wnsFN2wvkmX+7pmOS5Z
	FLNf36F3tcszeTakRv+3yqAcxEhNmW01ytL1jzohjIf8YNABsvyp4tYaK
	wub2U+XSbWt09Q/v8Ltx8nK4FM5sg8S544vWxeCbLWbHn1AfX8Cqyts6k k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D8CAC7w51Y/xbLJq1eGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBhDYnhDiKepB7l2KGIoM6FQECAQEBAQEBAWIohRMVQTUCJgJsCAEBiXS?=
	=?us-ascii?q?va4Ili1MBAQgCJhN4hUGCBQiIAoI6gl8BBJtykhSBYwEXiESGRogsimk1In4fE?=
	=?us-ascii?q?wgVFYcAPopTAQEB?=
X-IronPort-AV: E=Sophos;i="5.35,141,1484006400"; d="scan'208";a="692104933"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 13:46:33 +0000
Received: from [10.61.250.222] ([10.61.250.222])
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id v1ADkWoo006549;
	Fri, 10 Feb 2017 13:46:33 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: akuster808@gmail.com
Message-ID: <880586ee-3ead-9581-cb55-f6a481b68ef3@cisco.com>
Date: Fri, 10 Feb 2017 15:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com
Subject: Is Krogoth release still maintained?
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
X-List-Received-Date: Fri, 10 Feb 2017 13:59:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

I see that Krogoth branches in openembedded-core and
meta-openembedded layers were last updated 3 months ago.

So is Krogoth release still maintained? If yes, when and
how often do you plan do update it?

Thanks,
Ruslan


