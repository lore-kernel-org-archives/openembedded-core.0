Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1A21671AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:53:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 00:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="69877826"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Feb 2017 00:53:21 -0800
To: openembedded-core@lists.openembedded.org
References: <20170227200707.4566-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <92df5897-cca5-bef2-1f97-ae8a967e9354@linux.intel.com>
Date: Tue, 28 Feb 2017 10:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170227200707.4566-1-raj.khem@gmail.com>
Subject: Re: [PATCH V2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 28 Feb 2017 08:53:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2017 10:07 PM, Khem Raj wrote:
> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go

If this does make it into oe-core (I still think it shouldn't), who is 
the assigned maintainer? I don't see a poky patch for that.

Alex


