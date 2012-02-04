Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtU85-0007bw-TN
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 02:09:26 +0100
Received: by eaal10 with SMTP id l10so936884eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 17:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=APkt4CWjj0n9tEGECqtZ2bdpbxZswUdcJNET7U5ZscM=;
	b=XJmfuv+qFWu7ARvBVIo+vHaJkajWTu2JFhH7/9i6WhX/19ARQ9ti7M9T43Arex7Z3v
	3gbvd/B8o7qoDf47PA4Jvmql0FKGrOf9/hhooZYHgtvAwlcQAIeCejNt81TYFUeCSyHr
	lvfPO1RAbv8bjC0eGSmi8JzMspaGWEIOjVEOc=
Received: by 10.213.28.136 with SMTP id m8mr1523750ebc.98.1328317288061;
	Fri, 03 Feb 2012 17:01:28 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	y12sm28231348eeb.11.2012.02.03.17.01.27 (version=SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 17:01:27 -0800 (PST)
Message-ID: <4F2C82ED.1070706@gmail.com>
Date: Sat, 04 Feb 2012 01:59:25 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328311971-2340-1-git-send-email-tworaz666@gmail.com>
	<3019EDC5-B5F9-48AC-8711-2C2FEAAB3DAF@dominion.thruhere.net>
In-Reply-To: <3019EDC5-B5F9-48AC-8711-2C2FEAAB3DAF@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] webkit-gtk: Fix error.html resource path.
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
X-List-Received-Date: Sat, 04 Feb 2012 01:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2012 01:34 AM, Koen Kooi wrote:
> Op 4 feb. 2012, om 00:32 heeft Peter Tworek het volgende geschreven:
>
>> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
>> Reviewed-by: Paul Menzel<paulepanter@users.sourceforge.net>
> missing PR bump
Yep, bumped in patch 2/2. Do you want me to bump it in each one?

/ptw



