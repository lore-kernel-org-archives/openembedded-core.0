Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C2AA671A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 14:18:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2017 07:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,500,1500966000"; d="scan'208";a="136711248"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 Oct 2017 07:17:35 -0700
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
Date: Mon, 9 Oct 2017 17:13:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171009141227.21795-1-otavio@ossystems.com.br>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Mon, 09 Oct 2017 14:18:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/09/2017 05:12 PM, Otavio Salvador wrote:
>
> -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=8d8c7bc32f8797d23f5cf605d9339d2d \
> +LIC_FILES_CHKSUM = "file://Copyright.txt;md5=24600643e5d1d2b8f7478ae5c9074949 \
>                       file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"

What has changed in Copyright.txt? If it's just the copyright years, you 
can exclude the line using beginline/endline.


Alex

