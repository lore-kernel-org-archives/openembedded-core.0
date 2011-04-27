Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QF9SD-0005ni-KF
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 20:27:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 11:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,275,1301900400"; d="scan'208";a="426574519"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 11:24:41 -0700
Message-ID: <4DB85F68.6030405@linux.intel.com>
Date: Wed, 27 Apr 2011 11:24:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Antonio Ospite <ospite@studenti.unina.it>
References: <cover.1303889119.git.sgw@linux.intel.com>	<bd0798120559a8aca726db8e962bbbafb80c2a54.1303889119.git.sgw@linux.intel.com>
	<20110427102440.8b5f8ec7.ospite@studenti.unina.it>
In-Reply-To: <20110427102440.8b5f8ec7.ospite@studenti.unina.it>
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/52] sat-solver: fix arch=all packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 18:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2011 01:24 AM, Antonio Ospite wrote:
> On Wed, 27 Apr 2011  0:29:19 -0700
> Saul Wold<sgw@linux.intel.com>  wrote:
>
>> From: Qing He<qing.he@intel.com>
>>
>> add a new options to set noarch archs as all so platform independent
>> packages can be recognized and installed.
>>
>> fixes [YOCTO #993]
>>
>
Yes this is the Yocto Project Bugzilla, located at 
http://bugzilla.yoctoproject.org.

> This is a question rather than a comment: would it make sense to use an
> actual URL for issues? I mean can [YOCTO #993] be found in some
> publicly accessible bug tracking system for people to see what it is
> about?
>
>> Signed-off-by: Qing He<qing.he@intel.com>
>> ---
>
>


