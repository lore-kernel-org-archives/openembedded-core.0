Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RlJN5-0003kp-SI
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 13:03:07 +0100
Received: by wibhm17 with SMTP id hm17so1173372wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 03:55:37 -0800 (PST)
Received: by 10.180.83.72 with SMTP id o8mr17560872wiy.22.1326369337104;
	Thu, 12 Jan 2012 03:55:37 -0800 (PST)
Received: from [128.224.170.207] ([89.121.200.106])
	by mx.google.com with ESMTPS id v13sm5442615wbm.14.2012.01.12.03.55.36
	(version=SSLv3 cipher=OTHER); Thu, 12 Jan 2012 03:55:36 -0800 (PST)
Message-ID: <4F0ECA38.80909@gherzan.ro>
Date: Thu, 12 Jan 2012 13:55:36 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
	<1356479.bsRlACIzx0@helios> <4F0D989D.4080907@gherzan.ro>
	<4F0E896F.8020107@linux.intel.com>
In-Reply-To: <4F0E896F.8020107@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.py: remove duplicate '&' or '|' from LICENSE
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
X-List-Received-Date: Thu, 12 Jan 2012 12:03:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 09:19 AM, Saul Wold wrote:
> I think I agree with Paul here, Beth has sent out a proposal for that 
> and by making a change here may allow the bad behavior to continue.
>
> Sau!

In this case we can drop this and the problem will remain (will have to 
be fixed) in meta-oe layers.

@g


