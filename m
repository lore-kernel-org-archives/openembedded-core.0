Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QbjVf-0007ai-Db
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:24:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2011 18:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21293535"
Received: from miles.jf.intel.com (HELO [10.7.199.155]) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 18:20:18 -0700
Message-ID: <4E0A7DCF.6090709@intel.com>
Date: Tue, 28 Jun 2011 18:20:15 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307058256.git.scott.a.garman@intel.com>	<9591788655a4de97cc5f6a0fd98e742e3ebcab23.1307058256.git.scott.a.garman@intel.com>
	<1309266295.20015.287.camel@rex>
In-Reply-To: <1309266295.20015.287.camel@rex>
Subject: Re: [PATCH 4/7] useradd.bbclass: new class for managing user/group permissions
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
X-List-Received-Date: Wed, 29 Jun 2011 01:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 06:04 AM, Richard Purdie wrote:
> Hi Scott,
>
> Sorry its taken me a while to get to this. Some comments below.

Hi Richard,

Thanks for the feedback. I'm hoping to get you a v2 pull request 
sometime tomorrow which incorporates some of your suggested changes. 
Mark gave good explanations on the points I will not be changing.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


