Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rs3ua-0001GI-Sf
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:57:37 +0100
Received: from mail-pw0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Jan 2012 18:49:42 -0800
Received: by pbbb2 with SMTP id b2so843621pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 18:49:42 -0800 (PST)
Received: by 10.68.75.79 with SMTP id a15mr46760115pbw.62.1327978182448;
	Mon, 30 Jan 2012 18:49:42 -0800 (PST)
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net.
	[76.115.40.64])
	by mx.google.com with ESMTPS id o7sm51829216pbq.8.2012.01.30.18.49.41
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 18:49:41 -0800 (PST)
Message-ID: <4F2756CB.806@intel.com>
Date: Mon, 30 Jan 2012 18:49:47 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1327977970.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1327977970.git.scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] e2fsprogs streamlining
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
X-List-Received-Date: Tue, 31 Jan 2012 02:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 06:47 PM, Scott Garman wrote:
> Hello,
>
> Koen Kooi suggested that the quotefix patch was not needed,
> and the build of the recipe should now be multithread-safe.
> My testing has confirmed this.

Sorry, I forgot a PR bump - my branch will be updated with this momentarily.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


