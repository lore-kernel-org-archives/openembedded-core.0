Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 504E2605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:56:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 07:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; 
   d="scan'208";a="5749791"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 07:56:17 -0800
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171116155215.21122-1-ricardo.ribalda@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e2254f9e-7b5c-f21e-e2cd-48808f938f86@linux.intel.com>
Date: Thu, 16 Nov 2017 17:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171116155215.21122-1-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 15:56:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 05:52 PM, Ricardo Ribalda Delgado wrote:
> The update to 0.43.0 forgot to add this patch required for qt builds

Please explain why the patch is needed and what does it do (in the 
commit message of the patch file).

Alex

