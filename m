Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 000D4782C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:37:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 10:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="1197309579"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2017 10:37:28 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
	<80eaf75bf2474828501d52875bf724f28cdecb64.1500470150.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=VpVNn+K21qdJ+zAYtMCaH+0R8EOSEwNz1ZaTzMYSa+4g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e2c309fc-2497-1d37-186e-f4185b2a8b0b@linux.intel.com>
Date: Wed, 19 Jul 2017 20:35:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VpVNn+K21qdJ+zAYtMCaH+0R8EOSEwNz1ZaTzMYSa+4g@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] openssh: depend on openssl 1.0
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
X-List-Received-Date: Wed, 19 Jul 2017 17:37:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/19/2017 07:46 PM, Andre McCurdy wrote:
>> Openssl maintainers are not in a hurry to get 1.1 support in;
> 
> Openssh maintainers?

Yes, them.

Alex

