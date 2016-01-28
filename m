Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCF1577154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 21:25:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2016 13:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,360,1449561600"; d="scan'208";a="736178687"
Received: from jzhang80-mac02.jf.intel.com (HELO [10.211.55.6]) ([10.24.2.39])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2016 13:25:28 -0800
To: openembedded-core@lists.openembedded.org
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Message-ID: <56AA8748.40003@linux.intel.com>
Date: Thu, 28 Jan 2016 13:25:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Backport Request: kernel-yocto: fix checkout bare-cloned kernel repositories
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
X-List-Received-Date: Thu, 28 Jan 2016 21:25:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please help to bring this patch to Jethro branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4487e3a4205188cf53930147c7e88d98f0d8a8e0

This fix was from updating kernel labs for Jethro and we think it should 
be a good one on Jethro.

Thanks lot!

