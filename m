Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85AF760938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 13:12:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP; 11 Nov 2016 05:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,621,1473145200"; d="scan'208";a="30126027"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2016 05:12:52 -0800
To: openembedded-core@lists.openembedded.org
References: <20161110003935.1858-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
Date: Fri, 11 Nov 2016 15:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161110003935.1858-1-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 13:12:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2016 02:39 AM, Khem Raj wrote:
> This is converging the recipes for go from
> meta-virtualization and oe-meta-go

Wait a moment, why this should go to oe-core and not to meta-go? Is 
there something in oe-core itself that requires presence of go compiler?

Alex


