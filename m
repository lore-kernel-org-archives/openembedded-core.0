Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C2EF465CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:47:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 23:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,425,1508828400"; 
   d="scan'208";a="3875825"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2017 23:47:27 -0800
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
	<db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
	<CAPybu_28ZvnJTjd1KiNx375+kfh1c+q=y65paJYDeHpJyd5qew@mail.gmail.com>
	<784b237e-8cad-d450-5d23-32adc961110a@linux.intel.com>
	<CAPybu_1+eRCMvWgCBX4wGMysv9OS7bvZTCF+H1p3cjkUQcmkpg@mail.gmail.com>
	<d718b91c-ae1e-0171-3eb1-527ceadff383@linux.intel.com>
	<CAPybu_1oc+5yPRoXkG1QYqsvvf8NbQrCH0BHZW4kLi6BM-RKLQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d6546783-b85f-1d67-f02b-b3484a37fb2c@linux.intel.com>
Date: Tue, 19 Dec 2017 09:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_1oc+5yPRoXkG1QYqsvvf8NbQrCH0BHZW4kLi6BM-RKLQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Tue, 19 Dec 2017 07:47:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/18/2017 04:26 PM, Ricardo Ribalda Delgado wrote:

>> Yes, sure. In a moment I'll publish a new patchset that introduces meson
>> 0.44 and drops your previous 0.43-compatible version of the patch, and then
>> you can rebase on top of that and send to the list.
> Sent
> 
> Feel free to include it to your patchset if you need a v6

Thanks, I guess Ross can take it directly, but I'll add it if another 
resend of the whole set is needed.

Alex

