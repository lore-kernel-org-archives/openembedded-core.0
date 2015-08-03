Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63DD4757A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 17:10:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2015 10:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,602,1432623600"; d="scan'208";a="761012279"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2015 10:10:11 -0700
Message-ID: <55BFA0B6.8050301@linux.intel.com>
Date: Mon, 03 Aug 2015 20:11:18 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<fd641de4c497143e62a5f662584ff91c65bec9da.1438619216.git.alexander.kanavin@linux.intel.com>
	<20150803165832.GC2465@jama>
In-Reply-To: <20150803165832.GC2465@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] stress: update checksums to match upstream tarball
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
X-List-Received-Date: Mon, 03 Aug 2015 17:10:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2015 07:58 PM, Martin Jansa wrote:

> Did you forget to update this? Commit message says something about
> Fedora tarball...

Nope - this commit is an update to an earlier commit which got merged 
into master before I could fix it. I'll add a reference.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5f9d379fac16cfe6ca155077e6279242e72a92a9


Alex

