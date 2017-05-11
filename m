Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 13ED871B13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 07:44:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 May 2017 00:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,323,1491289200"; d="scan'208";a="1146515102"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2017 00:44:15 -0700
To: Khem Raj <raj.khem@gmail.com>, "Davis, Michael" <michael.davis@essvote.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
	<655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
	<CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8016a95d-823d-835f-6db9-230079ce5026@linux.intel.com>
Date: Thu, 11 May 2017 10:44:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Thu, 11 May 2017 07:44:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2017 12:08 AM, Khem Raj wrote:
> On Wed, May 10, 2017 at 1:48 PM, Davis, Michael
> <michael.davis@essvote.com> wrote:
>> I think most of the major distros have either switched or are in the process
>> this year.
>>
>
> are there some info on the policy decisions of other distros ?
> we should try to follow the suite then

Both Fedora and Debian default to 1.1 in their upcoming versions. 1.0 is 
provided only as a legacy package. So same as here.

Alex


