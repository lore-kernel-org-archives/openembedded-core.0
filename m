Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TjC76-0006i8-LB
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 17:58:33 +0100
Received: from [192.168.101.14] (afplatform.bmw-carit.intra [192.168.101.14])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 28DB440043;
	Thu, 13 Dec 2012 17:07:40 +0100 (CET)
Message-ID: <50CA05C6.8040509@oss.bmw-carit.de>
Date: Thu, 13 Dec 2012 17:43:50 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<50C66DAA.8090800@linux.intel.com>
In-Reply-To: <50C66DAA.8090800@linux.intel.com>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils: Replacing path to native python by path to python in the image to support python packages with console-script setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 16:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2012 12:18 AM, Saul Wold wrote:
> Thanks for the patch, good catch, but need a slight tweak.
>
> Sau!
>
Thanks for the hint. I refined the patch.

Lukas


