Return-Path: <igor.santos@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id D38A360034
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 16:40:22 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 7 May 2015 13:40:25 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel (10.4.59.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 7 May 2015 13:40:17 -0300
Message-ID: <554B956F.1050403@aker.com.br>
Date: Thu, 7 May 2015 13:40:15 -0300
From: Igor de Souza Santos <igor.santos@aker.com.br>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>	<CAJTo0LbMVTFqMxXC=6Dukia50oAkko5Rc16zA9T7pGTgzYVhww@mail.gmail.com>
	<CAP9ODKoPPykye0Jip83AKdQ8hvn+p8Pupb7g0pY2ZaRHeSqBnA@mail.gmail.com>
In-Reply-To: <CAP9ODKoPPykye0Jip83AKdQ8hvn+p8Pupb7g0pY2ZaRHeSqBnA@mail.gmail.com>
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: 637557b78f763eb0acb98040780651a40dfb3612-15o
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add ctags and cscope
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
X-List-Received-Date: Thu, 07 May 2015 16:40:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07-05-2015 13:30, Otavio Salvador wrote:
> On Thu, May 7, 2015 at 12:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 6 May 2015 at 22:38, Igor Santos <igor.santos@aker.com.br> wrote:
>>> Hi, these series add ctags and cscope to the devtools.
>>> It's interesting to add these tools to the stable branches.
>>
>> Why should these be in oe-core instead of another layer such as meta-oe?
> meta-oe seems to be the right place for it.
>
Ok, I will send the patches to the meta-oe, thank you.


