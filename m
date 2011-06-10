Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUsMq-000367-OA
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 05:26:40 +0200
Received: by pwj9 with SMTP id 9so1103310pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 20:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=h994omcVBqK7QtqN8tFYLwjxvktK7jbwfjsSzyj8NpM=;
	b=J2mhN3YuC/6/yEu0fhvugfLFAZdksA3rk2fnMDtTFsfq2UkUwloU6NJVzWsfnUksqk
	8pegCAAJdVzQIucpjiXtE0ZhJgZPQsblpVXn27TPuOhbFh9mAWN3Bu2Mpbia/eeIE0up
	i1Mkn2GWxi4bt/OUb2w9Ii5Cbv7Pl0OR+kp3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CilBHQg4Cv95WKN55jG0f5L+PjcpI69ynTQ7WyYp89apAqE2Pcv9dGeyUY69TtVUmN
	Cd6mC/6mmnGJM6tm2rPcbehMhneuNjQPJ22bxpeJ0hUDnAB9C/bvfBuxRrTclKJsEYVP
	pheQxRluJtFhu+bOIXXT4rsOCstALn/3uunFg=
Received: by 10.142.215.19 with SMTP id n19mr247460wfg.265.1307676199837;
	Thu, 09 Jun 2011 20:23:19 -0700 (PDT)
Received: from [172.23.8.101] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id t15sm2385993wfh.4.2011.06.09.20.23.18
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 20:23:18 -0700 (PDT)
Message-ID: <4DF18E24.1080405@gmail.com>
Date: Thu, 09 Jun 2011 20:23:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307510707.git.kai.kang@windriver.com>	<f0caff18791ca02c18eeb8205f3efaffd1e88cc9.1307510707.git.kai.kang@windriver.com>
	<4DF18CBE.2080805@linux.intel.com>
In-Reply-To: <4DF18CBE.2080805@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake: add another local configuration file
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
X-List-Received-Date: Fri, 10 Jun 2011 03:26:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 08:17 PM, Saul Wold wrote:
> So please just submit a single file local.conf.extended.

extended.local.conf.sample


