Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RKuAM-0006U1-AM
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 16:52:50 +0100
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2011 08:46:28 -0700
Received: by wwi36 with SMTP id 36so1084542wwi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 08:46:27 -0700 (PDT)
Received: by 10.227.60.130 with SMTP id p2mr18477725wbh.3.1320075987135;
	Mon, 31 Oct 2011 08:46:27 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id q30sm33142729wbn.17.2011.10.31.08.46.24
	(version=SSLv3 cipher=OTHER); Mon, 31 Oct 2011 08:46:25 -0700 (PDT)
Message-ID: <4EAEC2CE.400@intel.com>
Date: Mon, 31 Oct 2011 08:46:22 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
	<62b3eae763911554ab01754726ed7adacad1a8a4.1319576293.git.scott.a.garman@intel.com>
	<4EA86F93.4080407@intel.com>
	<201110310908.45138.paul.eggleton@linux.intel.com>
In-Reply-To: <201110310908.45138.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
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
X-List-Received-Date: Mon, 31 Oct 2011 15:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2011 02:08 AM, Paul Eggleton wrote:
> On Wednesday 26 October 2011 21:37:39 Saul Wold wrote:
>>> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "1 month"
>>> -RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/05/16"
>>> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "2 months"
>>> +RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/10/21"
>>
>> These date formats should be MMM DD, YYYY also, for all the data listed
>> below also.
>
> I'd been meaning to ask this before - is there a good reason for not being
> consistent and using the same format for all date fields in this file?
>
Maybe I am missing your comment, is that what I not suggested in my 
comment above?  All date formats in the distro_tracking_fields should be 
in the MMM DD, YYY format.

Sau!

> Cheers,
> Paul
>



