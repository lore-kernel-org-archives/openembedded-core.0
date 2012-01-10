Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rkhjg-000189-Lh
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:51:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2012 11:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110796634"
Received: from unknown (HELO [10.255.14.3]) ([10.255.14.3])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2012 11:44:26 -0800
Message-ID: <4F0C951A.70809@linux.intel.com>
Date: Tue, 10 Jan 2012 11:44:26 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326216024.git.josh@linux.intel.com>
	<2dd7849a0c3b785b4edea7d2e8dd4d4cfb71ac57.1326216024.git.josh@linux.intel.com>
	<CAP9ODKr+UtbWba+XJNYQj9jKZz+uuKKy7+n6Foy9GOcPLZMkPA@mail.gmail.com>
In-Reply-To: <CAP9ODKr+UtbWba+XJNYQj9jKZz+uuKKy7+n6Foy9GOcPLZMkPA@mail.gmail.com>
Subject: Re: [PATCH 1/3] alsa-state: add alsa-state from oe classic
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
X-List-Received-Date: Tue, 10 Jan 2012 19:51:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/12 11:30, Otavio Salvador wrote:
> On Tue, Jan 10, 2012 at 15:39, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>
>     ...
>
>     +++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.state
>     @@ -0,0 +1 @@
>     +# Dummy file, do not delete
>     \ No newline at end of file
>
>
> ^ please fix it.

Pushed to the branch.

Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


